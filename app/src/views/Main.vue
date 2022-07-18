<template>
	<div id="main" class="fit q-pa-xl">
		<h3 class="text-weight-medium">Simple Kanban</h3>
		<board-selector-component
			@add-board="addBoard"
			@delete-board="deleteBoard"
			:boards="boards"
		></board-selector-component>
		<board-component class="q-mt-md"></board-component>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";
	import { useQuasar } from "quasar";
	import axios from "axios";

	import type { Board } from "../types/types";

	import BoardComponent from "../components/BoardComponent.vue";
	import BoardSelectorComponent from "../components/BoardSelectorComponent.vue";

	export default defineComponent({
		components: { BoardComponent, BoardSelectorComponent },
		name: "MainView",
		setup() {
			const $q = useQuasar();

			return {
				triggerNegative(message: string) {
					$q.notify({
						type: "negative",
						message: message,
						position: "top-right",
					});
				},
			};
		},
		created() {
			axios.defaults.baseURL = "http://localhost:4000";
		},
		beforeMount() {
			this.getBoards();
		},
		data() {
			return {
				boards: [] as Array<Board>,
			};
		},
		methods: {
			getBoards() {
				axios.get("/boards").then((response) => {
					let boards = response.data.map(
						(board: { id: number; name: string }) => {
							return {
								value: board.id,
								label: board.name,
							};
						}
					);

					this.boards = boards;
				});
			},
			addBoard(newBoardName: string) {
				if (newBoardName.length < 3) {
					this.triggerNegative(
						"Board name must be at least 3 characters long."
					);
					return;
				}

				let foundBoard: boolean = this.boards.some(
					(board: Board) => board.label === newBoardName
				);

				if (foundBoard) {
					this.triggerNegative("Board name already exists.");
					return;
				}

				axios
					.post("/boards", { name: newBoardName })
					.then((response) => {
						let board: Board = {
							value: response.data.id,
							label: newBoardName,
						};

						this.boards.push(board);
					})
					.catch((error) => {
						this.triggerNegative(error.response.data.message);
					});
			},
			deleteBoard(selectedBoard: number) {
				axios
					.delete(`/boards/${selectedBoard}`)
					.then(() => {
						this.boards = this.boards.filter(
							(board: Board) => board.value !== selectedBoard
						);
					})
					.catch((error) => {
						this.triggerNegative(error.response.data.message);
					});
			},
		},
	});
</script>

<style lang="sass" scoped>
	#main
		display: flex
		flex-direction: column
		justify-content: center
		align-items: center
</style>

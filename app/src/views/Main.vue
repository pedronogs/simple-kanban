<template>
	<div id="main" class="fit q-pa-xl">
		<board-selector-component
			@add-board="addBoard"
			:boards="boards"
		></board-selector-component>
		<board-component class="q-mt-md"></board-component>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";
	import { useQuasar } from "quasar";

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
		data() {
			return {
				boards: [
					{
						value: 0,
						label: "Quadro 01",
					},
					{
						value: 1,
						label: "Quadro 02",
					},
				] as Array<Board>,
			};
		},
		methods: {
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

				this.boards.push({
					value: this.boards.length,
					label: newBoardName,
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

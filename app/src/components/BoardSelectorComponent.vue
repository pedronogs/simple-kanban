<template>
	<div id="board-selector" class="full-width">
		<q-btn-toggle
			no-caps
			toggle-color="primary"
			color="grey-3"
			text-color="primary"
			v-model="selectedBoard"
			:options="boards"
			class="button-outline q-mr-md"
		/>

		<q-btn
			class="action-button text-primary round-border outline-icon"
			@click="createBoard = true"
		>
			<q-icon name="fas fa-plus" size="xs"></q-icon>
		</q-btn>

		<q-btn
			class="action-button text-primary round-border outline-icon q-ml-auto"
		>
			<q-icon name="fas fa-gear" size="xs"></q-icon>
		</q-btn>

		<!-- Dialogs -->
		<q-dialog v-model="createBoard" persistent>
			<q-card style="min-width: 350px">
				<q-card-section>
					<div class="text-h6">New Board Name</div>
				</q-card-section>

				<q-card-section class="q-pt-none">
					<q-input
						dense
						v-model="newBoardName"
						autofocus
						@keyup.enter="createBoard = false"
					/>
				</q-card-section>

				<q-card-actions align="right" class="text-primary">
					<q-btn flat label="Cancel" v-close-popup />
					<q-btn flat label="Create" v-close-popup @click="addBoardEvent" />
				</q-card-actions>
			</q-card>
		</q-dialog>
	</div>
</template>

<script lang="ts">
	import { defineComponent, PropType } from "vue";
	import { useQuasar } from "quasar";

	import type { Board } from "../types/types";

	export default defineComponent({
		name: "BoardSelectorComponent",
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
				newBoardName: "" as string,
				createBoard: false as boolean,
				selectedBoard: 0 as number,
			};
		},
		props: {
			boards: {
				type: Array as PropType<Array<Board>>,
				required: true,
			},
		},
		methods: {
			addBoardEvent() {
				this.$emit("add-board", this.newBoardName);
			},
		},
	});
</script>

<style lang="sass" scoped>
	#board-selector
		display: flex
		flex-direction: row
		justify-content: flex-start
		align-items: center

	.action-button
		height: 60%
		width: 2%

	.button-outline
		border: 1px solid #027be3

	.round-border
		background-color: white
		border-radius: 80px

	.outline-icon
		border: 1px solid #027be3
</style>

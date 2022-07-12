<template>
	<div id="board-selector-div">
		<div v-for="board in boards" :key="board.id" class="board-index">
			{{ board.name }}
		</div>

		<div id="board-selector-plus">
			<i class="fa fa-plus"></i>
		</div>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";

	export default defineComponent({
		name: "BoardSelectorComponent",
		data() {
			return {
				boards: [
					{
						id: 0,
						name: "Quadro 01",
					},
					{
						id: 1,
						name: "Quadro 02",
					},
				],
			};
		},
		props: {
			msg: String,
		},
	});
</script>

<style scoped>
	#board-selector-div {
		width: 100%;
		height: 100%;

		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
	}

	.board-index {
		width: 10%;
		height: 100%;

		display: flex;
		align-items: center;
		justify-content: center;

		margin-right: 15px;

		border: 2px solid rgb(192, 192, 192);
		border-radius: 5px;
		box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
			rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	}

	#board-selector-plus {
		height: 25px;
		width: 25px;

		display: flex;
		justify-content: center;
		align-items: center;

		background-color: white;
		border: 2px solid rgb(73, 73, 73);
		border-radius: 50px;
	}
</style>

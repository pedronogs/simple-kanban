<template>
	<div id="board-div">
		<board-selector-component style="height: 4%"></board-selector-component>
		<div id="board" style="margin-top: 15px">
			<panel-component
				v-for="panel in panels"
				:key="panel.id"
				:header="panel.header"
				class="panel-spacing"
			></panel-component>
		</div>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";
	import BoardSelectorComponent from "./BoardSelectorComponent.vue";
	import PanelComponent from "./PanelComponent.vue";

	export default defineComponent({
		components: { BoardSelectorComponent, PanelComponent },
		name: "BoardComponent",
		data() {
			return {
				panels: [
					{
						id: 0,
						header: "TO-DO",
					},
					{
						id: 1,
						header: "DOING",
					},
					{
						id: 2,
						header: "DONE",
					},
					{
						id: 3,
						header: "BACKLOG",
					},
				],
			};
		},
	});
</script>

<style scoped>
	#board-div {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;

		width: 100%;
		height: 100%;
	}

	#board {
		width: 100%;
		height: 90%;

		display: flex;
		flex-direction: row;
		align-items: center;

		margin-top: 5px;

		border: 2px solid rgb(192, 192, 192);
		border-radius: 5px;
		box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
			rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	}

	.panel-spacing {
		padding-left: 20px;
		padding-right: 20px;
	}
</style>

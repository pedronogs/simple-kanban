<template>
	<div id="board" class="full-width">
		<panel-component
			v-for="panel in panels"
			:key="panel.id"
			:header="panel.header"
			class="q-px-md"
		></panel-component>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";
	import PanelComponent from "./PanelComponent.vue";

	export default defineComponent({
		components: { PanelComponent },
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

<style lang="sass" scoped>
	#board
		height: 90%

		display: flex
		flex-direction: row
		align-items: center

		border: 2px solid rgb(192, 192, 192)
		border-radius: 5px
		box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px
</style>

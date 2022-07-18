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

		border-radius: 5px
		box-shadow:0.7px 3.2px 3.3px rgba(0, 0, 0, 0.022), 1px 4.6px 11.2px rgba(0, 0, 0, 0.05),2px 9px 50px rgba(0, 0, 0, 0.1)
</style>

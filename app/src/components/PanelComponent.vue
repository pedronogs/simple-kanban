<template>
	<div class="panel-div">
		<div class="panel-header">
			<strong>{{ header }}</strong>
		</div>
		<div class="panel-content">
			<task-component
				v-for="task in tasks"
				:key="task.id"
				:content="task.content"
			></task-component>
		</div>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";
	import TaskComponent from "./TaskComponent.vue";

	export default defineComponent({
		name: "PanelComponent",
		components: { TaskComponent },
		data() {
			return {
				tasks: [
					{
						id: 0,
						content: "Teste",
					},
				],
			};
		},
		props: {
			header: {
				type: String,
			},
		},
	});
</script>

<style scoped>
	.panel-div {
		height: 95%;
		width: 25%;
	}

	.panel-header {
		text-align: center;
	}

	.panel-content {
		height: 95%;
		width: 100%;

		margin-top: 2%;

		border: 2px solid grey;
	}
</style>

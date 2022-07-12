<template>
	<div class="task-div">
		<div style="display: flex; flex-direction: row">
			<div class="task-check">
				<input type="checkbox" id="checkbox" v-model="checked" />
			</div>
			<div class="task-content">
				{{ content }}
			</div>
		</div>

		<div class="task-spacer"></div>
	</div>
</template>

<script lang="ts">
	import { defineComponent } from "vue";

	export default defineComponent({
		name: "TaskComponent",
		data() {
			return {
				checked: false,
			};
		},
		props: {
			content: {
				type: String,
			},
		},
	});
</script>

<style scoped>
	.task-div {
		width: 95%;
		height: 5%;

		display: flex;
		flex-direction: column;

		padding: 10px;

		overflow-wrap: anywhere;
	}

	.task-check input {
		margin: 0;
	}

	.task-content {
		margin-left: 10px;
	}

	.task-spacer {
		width: 100%;
		height: 1%;

		margin-top: 10px;

		background-color: lightgrey;
	}
</style>

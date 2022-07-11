<template>
  <div id="home-div">
    <board-component class="resize-board"></board-component>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import BoardComponent from "../components/BoardComponent.vue";
import BoardSelectorComponent from "../components/BoardSelectorComponent.vue";

export default defineComponent({
  components: { BoardComponent, BoardSelectorComponent },
  name: "HomeView",
});
</script>

<style scoped>
#home-div {
  height: 100%;
  width: 95%;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.resize-board {
  height: 70%;
  width: 95%;
}
</style>

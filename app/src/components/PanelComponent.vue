<template>
  <div class="panel-div">
    <div class="panel-header"><strong>{{header}}</strong></div>
    <div class="panel-content"></div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "PanelComponent",
  props: {
    header: {
      type: String
    }
  }
})
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
<template>
  <div id="main">
    <h1>SIMPLE-KANBAN</h1>
    <router-view />
  </div>
</template>

<style>
html, body {
  width: 100%;
  height: 100%;

  margin: 0;
  padding: 0;
}

#app, #main {
  width: 100%;
  height: 100%;

  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#main {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>

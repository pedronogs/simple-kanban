<template>
	<div id="wrapper">
		<router-view />
	</div>
</template>

<style lang="sass">
	@font-face
		font-family: 'Montserrat'
		src: url("./assets/fonts/montserrat/montserrat-variable.ttf")

	*
		font-family: 'Montserrat', sans-serif


	html, body
		width: 100%
		height: 100%
		margin: 0
		padding: 0

	#app
		width: 100%
		height: 100%

	#wrapper
		width: 100%
		height: 100%

		display: flex
		flex-direction: column
		justify-content: center
		align-items: center
</style>

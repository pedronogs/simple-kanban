<template>
	<div id="wrapper">
		<router-view />
	</div>
</template>

<style lang="sass">
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

<script lang="ts">
	import { goto } from '$app/navigation';
	import LogoWhite from '$lib/assets/svg/logo/logo-white.svelte';
	import LandingButton from '$lib/components/ui/button/landing-button.svelte';
</script>

<div class="flex w-full justify-center">
	<div
		class="relative z-38 flex w-full items-center justify-between bg-transparent px-4 py-8 xl:w-297 xl:px-12 xl:py-12"
	>
		<div>
			<LogoWhite />
		</div>
		<div
			class="textLink hidden items-center justify-center gap-x-14 font-extralight hover:cursor-pointer hover:text-white lg:flex"
		>
			<a href="#features">Features</a>
			<a href="#about">About</a>
		</div>
		<div class="hidden lg:block">
			<!-- //TODO: User auth -->
			{#if false}
				<LandingButton
					label="Go To Dashboard"
					variant="landing"
					onClick={() => goto('/dashboard')}
				/>
			{:else}
				<LandingButton label="Coming Soon" variant="landing" />
			{/if}
		</div>
	</div>
</div>

<style lang="postcss">
	.textLink {
		color: #fff;
		font-size: 1.125rem;
		font-weight: 300;
		line-height: normal;
	}
</style>

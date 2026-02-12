<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.png';
	import LandingHeader from '$lib/components/layout/header/landing-header.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<LandingHeader />
{@render children()}

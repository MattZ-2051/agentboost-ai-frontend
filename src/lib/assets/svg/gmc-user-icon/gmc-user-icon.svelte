<script lang="ts">
	import GradientBorder from './gradient-border.svelte';
	import UserIcon from './user-icon.svelte';
</script>

<div class="relative">
	<div class="absolute top-[-60%] right-[-60%]">
		<GradientBorder />
	</div>
	<div class="flex items-center justify-center">
		<UserIcon />
	</div>
</div>

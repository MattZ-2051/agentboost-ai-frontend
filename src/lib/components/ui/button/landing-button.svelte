<script lang="ts">
	import type { ButtonVariant } from './types';

	interface IProps {
		classes?: string;
		variant?: ButtonVariant;
		onClick?: () => void;
		onMouseEnter?: () => void;
		onMouseLeave?: () => void;
		label: string;
	}

	let {
		classes = undefined,
		variant = undefined,
		onClick = undefined,
		onMouseEnter = undefined,
		onMouseLeave = undefined,
		label
	}: IProps = $props();
</script>

<button
	type="button"
	class={`${variant} ${classes} relative stroke-white hover:cursor-pointer! hover:stroke-black! hover:opacity-100`}
	onclick={onClick}
	onmouseenter={onMouseEnter}
	onmouseleave={onMouseLeave}
>
	<div>
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
			<path
				d="M9 17.5002H3.5M6.5 12.0002H2M9 6.50024H4M17 3.00024L10.4036 12.2353C10.1116 12.644 9.96562 12.8484 9.97194 13.0188C9.97744 13.1671 10.0486 13.3054 10.1661 13.3961C10.3011 13.5002 10.5522 13.5002 11.0546 13.5002H16L15 21.0002L21.5964 11.7652C21.8884 11.3565 22.0344 11.1521 22.0281 10.9817C22.0226 10.8334 21.9514 10.6951 21.8339 10.6044C21.6989 10.5002 21.4478 10.5002 20.9454 10.5002H16L17 3.00024Z"
				stroke-width="1.80625"
				stroke-linecap="round"
				stroke-linejoin="round"
			/>
		</svg>
	</div>
	<div class="flex items-center justify-center gap-x-1.5">
		<p class="w-fit">{label}</p>
	</div>
</button>

<style lang="postcss">
	.landing {
		box-shadow: 0px 1.20417px 14.45px 0px rgba(195, 216, 231, 0.08);
		/* border: 1px solid #c3d8e730; */
		border: 1px solid rgba(255, 255, 255, 0.51);
		backdrop-filter: blur(3.612499952316284px);
		background: rgba(255, 255, 255, 0.02);
		height: 3rem;
		font-size: 16px;
		padding: 12px 20px;
		width: 13rem;
		justify-content: center;
		align-items: center;
		font-weight: 500;
		flex-shrink: 0;
		border-radius: 24px;
		display: flex;
		gap: 10px;
		color: white;
		z-index: 1;
		backdrop-filter: blur(3.612499952316284px);
	}

	.landing:hover {
		background: rgba(255, 255, 255, 1);
		color: black !important;
		stroke: black !important;
		fill: black !important;
	}

	.landing-dark {
		box-shadow: 0px 1.20417px 14.45px 0px rgba(195, 216, 231, 0.08);
		/* border: 1px solid #c3d8e730; */
		border: 1px solid rgba(255, 255, 255, 0.51);
		backdrop-filter: blur(3.612499952316284px);
		background-color: rgba(255, 255, 255, 0.02);
		height: 3rem;
		display: flex;
		gap: 10px;
		font-size: 18px;
		padding: 12px 20px;
		width: 13rem;
		justify-content: center;
		align-items: center;
		font-weight: 500;
		flex-shrink: 0;
		z-index: 1;
		backdrop-filter: blur(3.612499952316284px);
		background: linear-gradient(93deg, #3f8bfd 39.11%, #49f9ea 92.48%);
		background-clip: text;
		border-radius: 24px;
		stroke: #42adf8;
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	.landing-dark:hover {
		stroke: black !important;
		background: white;
		-webkit-text-fill-color: black;
	}
</style>

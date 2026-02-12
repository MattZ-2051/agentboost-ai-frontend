<script lang="ts">
	import cityVector from '$lib/assets/images/vector.png';
	import LandingSeperator from '$lib/assets/svg/landing-seperator.svelte';
	import LogoSoloWhite from '$lib/assets/svg/logo-solo-white.svelte';
	import BackgroundGradient from '$lib/pages/landing/components/gradient/background-gradient.svelte';
	import FeatureTabs from '$lib/pages/landing/components/feature-tabs/feature-tabs.svelte';
	import Button from '$lib/components/ui/button/button.svelte';
	import LandingButton from '$lib/components/ui/button/landing-button.svelte';
	import { onMount } from 'svelte';

	let elts: any = $state();
	let videoElement: HTMLVideoElement | null = $state(null);
	let isVideoHovered = $state(false);

	onMount(() => {
		document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
			anchor.addEventListener('click', function (e) {
				e.preventDefault();

				document.querySelector(this.getAttribute('href')).scrollIntoView({
					behavior: 'smooth'
				});
			});
		});
		elts = {
			text1: document.getElementById('text1'),
			text2: document.getElementById('text2')
		};

		const texts = ['faster', 'smarter', 'better'];

		const morphTime = 1.5;
		const cooldownTime = 0.5;

		let textIndex = texts.length - 1;
		let time = new Date();
		let morph = 0;
		let cooldown = cooldownTime;

		elts.text1.textContent = texts[textIndex % texts.length];
		elts.text2.textContent = texts[(textIndex + 1) % texts.length];

		function doMorph() {
			morph -= cooldown;
			cooldown = 0;

			let fraction = morph / morphTime;

			if (fraction > 1) {
				cooldown = cooldownTime;
				fraction = 1;
			}

			setMorph(fraction);
		}

		function setMorph(fraction: any) {
			elts.text2.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
			elts.text2.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

			fraction = 1 - fraction;
			elts.text1.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
			elts.text1.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

			elts.text1.textContent = texts[textIndex % texts.length];
			elts.text2.textContent = texts[(textIndex + 1) % texts.length];
		}

		function doCooldown() {
			morph = 0;

			elts.text2.style.filter = '';
			elts.text2.style.opacity = '100%';

			elts.text1.style.filter = '';
			elts.text1.style.opacity = '0%';
		}

		function animate() {
			requestAnimationFrame(animate);

			let newTime = new Date();
			let shouldIncrementIndex = cooldown > 0;
			let dt = ((newTime as any) - (time as any)) / 1000;
			time = newTime;

			cooldown -= dt;

			if (cooldown <= 0) {
				if (shouldIncrementIndex) {
					textIndex++;
				}

				doMorph();
			} else {
				doCooldown();
			}
		}

		animate();

		// Intersection Observer for video autoplay
		const videoObserver = new IntersectionObserver(
			(entries) => {
				entries.forEach((entry) => {
					if (entry.isIntersecting && videoElement) {
						videoElement.play();
					}
				});
			},
			{ threshold: 0.5 }
		);

		if (videoElement) {
			videoObserver.observe(videoElement);
		}

		return () => {
			if (videoElement) {
				videoObserver.unobserve(videoElement);
			}
		};
	});

	const section2ButtonStyle =
		'xl:w-[8rem]! w-[82px]! bg-transparent! text-sm! xl:text-lg! text-white/40! hover:text-[#48EDEC]! hover:bg-white/10!';

	const section2ButtonActiveStyle =
		'xl:w-[8rem]! w-[82px] bg-white/10! text-[#48EDEC] text-sm! xl:text-lg! text-primary-500! bg-opacity-10!';

	const featureTabs: string[] = ['Marketing', 'Insights', 'Listings', 'Buyers'];

	let selectedTab: string = $state(featureTabs[0]);
</script>

<div class="relative h-full w-full p-12 font-[Made-Evolve]! xl:p-12">
	<div class="elipse absolute"></div>
	<section class="flex w-full flex-col items-center justify-center">
		<div class="flex flex-col items-center justify-center">
			<div class="z-30 mt-8 flex h-9.75 w-full justify-center">
				<div class="relative z-30">
					<div
						class="top-0 left-0 inline-flex h-9.75 w-fit items-center justify-start rounded-[50px] bg-white/10 pt-2.25 pr-4 pb-2.5 pl-18.75 text-base shadow backdrop-blur-[7.22px]"
					>
						<div class="text-base leading-tight text-white">Beta Coming Soon</div>
					</div>
					<div
						class="absolute top-0.5 left-0.5 flex h-8.75 w-16.25 justify-center rounded-[50px] bg-white/10 shadow backdrop-blur-[7.22px]"
					></div>
					<div class="absolute top-2.25 left-5 text-center text-base leading-tight text-white">
						New
					</div>
				</div>
			</div>
			<div
				class="z-30 mt-8 flex w-full flex-col items-center text-[40px] leading-tight text-white xl:text-[90px] xl:leading-24"
			>
				<p class="hidden whitespace-nowrap xl:inline-block">We make your real</p>
				<p class="-ml-60 hidden xl:inline-block">
					estate business <span id="text1" class="textGradient1"></span>
					<span id="text2" class="textGradient1"></span>
				</p>
				<!-- mobile styles  -->
				<p class="inline-block whitespace-nowrap xl:hidden">We make your</p>
				<p class="inline-block text-center xl:hidden">real estate</p>
				<p class="inline-block whitespace-nowrap xl:hidden">
					business <span class="textGradient1">faster </span>
					<!-- <span id="text1" class="textGradient1" /> -->
					<!-- <span id="text2" class="textGradient1" /> -->
				</p>
				<!--------------------------------->
				<!--------------------------------->
			</div>
		</div>
		<p
			class="z-20 mt-6 mb-12 text-center text-[16px] leading-normal font-light whitespace-nowrap text-[#C0C4DA] xl:text-[22px]"
		>
			Elevate your expertise. Build your brand. <br class="inline-block md:hidden" />Own your
			market.
		</p>
		<!-- TODO: user auth -->
		{#if false}
			<LandingButton label="Go To Dashboard" variant="landing-dark" classes="z-[38]!" />
		{:else}
			<LandingButton label="Get Early Access" variant="landing-dark" classes="z-[38]!" />
		{/if}

		<div class="relative -mt-28 w-full">
			<div class="flex justify-center">
				<div class="mask absolute -left-32 z-10 h-full w-160 -rotate-90"></div>
				<div class="mask absolute -right-48 z-10 h-full w-160 rotate-90"></div>
				<div class="mask absolute bottom-0 z-30 h-140 w-full rotate-180 xl:h-160"></div>
				<img
					src={cityVector}
					alt=""
					class="z-20 -mt-12 h-160 w-full object-cover md:-mt-20 lg:-mt-32 xl:z-0 xl:mt-0 xl:inline-block xl:h-168 xl:w-7xl"
				/>
				<!-- <p
					class="absolute bottom-[10rem] z-[38] w-full text-center text-lg font-light text-white opacity-40 xl:bottom-[13rem]"
				>
					BACKED BY THE BEST
				</p> -->
			</div>
		</div>
	</section>
	<section
		class="relative mt-20 flex w-full flex-col items-center justify-center lg:mt-12"
		id="features"
	>
		<BackgroundGradient />
		<p class="text-center text-[30px] leading-tight text-white xl:text-6xl">
			The <span class="textGradient2">Power of AI </span> in <br class="inline-block xl:hidden" /> real
			estate
		</p>
		<div class="mt-6 mb-8.5 text-center text-[19px] font-light text-[#C0C4DA] sm:text-lg">
			<p class="whitespace-nowrap">
				Explore the tools that empower <br class="inline-block xl:hidden" /> you to work smarter &
				faster
				<br class="hidden xl:inline-block" />
				to <br class="inline-block xl:hidden" /> achieve your goals.
			</p>
		</div>
		<div class="rounded-[20px] border border-white/5 bg-zinc-950/0 p-1">
			<div
				class="h-56.25 w-full rounded-[19px] bg-white/0 shadow sm:w-150 md:h-100 md:w-150 lg:w-200 xl:h-160.75 xl:w-297"
				role="group"
				aria-label="Video player"
				onmouseenter={() => (isVideoHovered = true)}
				onmouseleave={() => (isVideoHovered = false)}
			>
				<video
					bind:this={videoElement}
					controls={isVideoHovered}
					muted
					loop
					playsinline
					width="100%"
					class="h-full w-full rounded-[19px]"
					src="https://storage.googleapis.com/agentboost-assets/agentboost.mov"
				>
					<track kind="captions" />
				</video>
			</div>
		</div>
		<!-- Mobile styles for under video feature section  -->
		<div class="just flex w-full justify-center pt-4 sm:px-0 xl:hidden">
			<div
				class="grid h-56.25 w-full grid-cols-2 items-center justify-center gap-x-8 gap-y-8 rounded-[20px] border border-white/10 bg-black/0 p-8 text-center text-lg text-white shadow backdrop-blur-[14.35px] sm:w-150 md:h-100 md:w-150 lg:w-200"
			>
				<p class="whitespace-nowrap">140 million+ <br /> property records</p>
				<p class="whitespace-nowrap">AI driven <br /> property insights</p>
				<p class="whitespace-nowrap">Automated <br /> social media</p>
				<p class="">Marketing <br />Analytics</p>
			</div>
		</div>
		<!-- Desktop styles for under video feature section -->
		<div class="mt-12 hidden w-full justify-center xl:flex xl:w-297">
			<div class="flex items-center text-[2rem] leading-9 font-normal text-white">
				<p class="whitespace-nowrap">140 million+ <br /> property records</p>
				<div class="mx-10 hidden xl:inline-block">
					<LandingSeperator />
				</div>

				<p class="whitespace-nowrap">AI driven <br /> property insights</p>
				<div class="mx-10 hidden xl:inline-block">
					<LandingSeperator />
				</div>
				<p class="whitespace-nowrap">Automated <br /> social media</p>
				<div class="mx-10 hidden xl:inline-block">
					<LandingSeperator />
				</div>
				<p class="">Marketing <br />analytics</p>
			</div>
		</div>
	</section>
	<section class="relative z-50 mt-20 bg-transparent text-white xl:mt-40">
		<p class="text-center text-[30px] leading-normal whitespace-nowrap xl:text-6xl">
			Effortless <span class="textGradient5">
				<br class="inline-block xl:hidden" /> expertise & exposure</span
			>
		</p>
		<div class="mt-6 mb-8.5 text-center text-lg font-light text-[#C0C4DA]">
			<p>Get your competitive advantage. <br class="inline-block xl:hidden" /> Get Boosted.</p>
		</div>
		<div class="flex w-full flex-col items-center justify-center">
			<div class="rounded-[40px] border border-white/10">
				<div class="m-[.15rem] flex rounded-[40px] border border-white/10 xl:m-1">
					{#each featureTabs as item (item)}
						<Button
							variant="variant-filled-surface"
							label={item}
							classes={` ${
								selectedTab === item ? section2ButtonActiveStyle : section2ButtonStyle
							} `}
							onClick={() => (selectedTab = item)}
						/>
					{/each}
				</div>
			</div>
		</div>
		<FeatureTabs {selectedTab} />
	</section>
	<section class="relative mt-20 text-white xl:mt-40" id="about">
		<div class="flex w-full flex-col items-center justify-center">
			<p
				class="text-center text-[30px] leading-normal text-neutral-100 xl:text-6xl xl:leading-18.75"
			>
				Our
				<span class="textGradient2">Mission</span>
			</p>
			<div class="mt-12 rounded-[20px] border border-white/5 bg-zinc-950/0 p-1">
				<div
					class="flex h-full w-full items-center rounded-[18px] border border-white/10 bg-black/30 p-4 leading-normal shadow backdrop-blur-[14.35px] md:w-150 lg:w-200 xl:h-75.5 xl:w-297 xl:p-12"
				>
					<div class="relative z-50 text-[18px] font-light text-[#C0C4DA] xl:text-2xl">
						<p class="">
							At Agent Boost, our mission is to craft cutting-edge tools specifically tailored for
							realtors like you. We recognize that optimizing your efficiency is pivotal to your
							business success.
						</p>
						<p class="mt-4">
							Our platform will remain in a state of constant evolution, perpetually harnessing the
							latest and most thrilling advancements in technology and AI to propel you towards
							greater speed and effectiveness as an agent. Our journey is just beginning.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="mt-20 mb-12 flex justify-center xl:mt-40">
		<div class="w-full rounded-[20px] border border-white/10 bg-zinc-950/0 p-1 md:w-fit">
			<div class="relative h-97 w-full md:h-125 md:w-150 lg:w-200 xl:w-297">
				<div class="cta absolute top-0 h-full w-full rounded-[20px]">
					<div class="relative flex h-full w-full items-center justify-center">
						<div class="absolute z-50 flex items-center">
							<div class="px-4 py-8 xl:mr-32">
								<p
									class="text-[30px] leading-tight font-normal text-white lg:leading-16.25 xl:text-[3.6rem]"
								>
									Ready to boost your <br />
									<span class="textGradient5">real estate business?</span>
								</p>
								<p class="mt-4 text-[18px] font-light text-[#C0C4DA]">
									Seize the opportunity to elevate your real estate business and <br
										class="hidden xl:inline-block"
									/>
									embrace a future of efficiency and expertise. Join Agent Boost AI
									<br class="hidden xl:inline-block" /> now and experience a revolution in realtor tools!
								</p>
								<LandingButton
									variant="landing"
									label="Coming Soon"
									classes="text-white mt-8 xl:mt-12"
								/>
							</div>
							<div class="hidden xl:inline-block">
								<LogoSoloWhite size={300} />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<style lang="postcss">
	.elipse {
		width: 179.625rem;
		height: 77.1875rem;
		border-radius: 2874px;
		background: linear-gradient(74deg, #3e80ff 32.14%, #49f9ea 87.5%);
		filter: blur(137px);
		-webkit-filter: blur(137px);
		-moz-filter: blur(137px);
		-o-filter: blur(137px);
		-ms-filter: blur(137px);
		top: -75rem;
		left: -50rem;
		z-index: 30;
		transform: translate3d(15px, 15px, -1px);
	}

	@media (max-width: 1500px) {
		.elipse {
			border-radius: 100%;
		}
	}

	@media (min-width: 1500px) {
		.elipse {
			top: -74rem;
			border-radius: 2874px;
		}
	}

	@media (min-width: 1800px) {
		.elipse {
			left: -28%;
		}
	}

	@media (min-width: 2000px) {
		.elipse {
			left: -20%;
		}
	}

	@media (min-width: 2300px) {
		.elipse {
			left: -10%;
		}
	}
	@media (min-width: 2500px) {
		.elipse {
			left: -4%;
		}
	}

	@media (min-width: 3000px) {
		.elipse {
			left: 7%;
		}
	}

	.textGradient1 {
		background: linear-gradient(88deg, #3f8bfd -50.22%, #49f9ea 89.43%);
		background-clip: text;
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	.textGradient2 {
		background: linear-gradient(89deg, #42aef8 24.63%, #48efed 60.38%);
		background-clip: text;
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	.textGradient5 {
		background: linear-gradient(81deg, #42adf8 6.82%, #48efec 84.99%);
		background-clip: text;
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	.mask {
		background: linear-gradient(180deg, #010101 0%, rgba(1, 1, 1, 0) 77.08%);
	}

	.cta {
		/* background: linear-gradient(180deg, black 50%, #3d7fff 140%, #49f9ea 110%); */
		background:
			linear-gradient(to bottom, black 25%, rgba(0, 0, 0, 0.3)),
			linear-gradient(to right, #3d7fff 34.33%, #49f9ea 97.28%);
	}

	#text1,
	#text2 {
		position: absolute;
		margin-left: 1rem;
	}
</style>

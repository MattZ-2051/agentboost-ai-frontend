<script lang="ts">
	import LandingBezier from '$lib/assets/svg/landing-bezier.svelte?raw';
	import AutomatedCampaign from '$lib/assets/svg/landing/feature-tabs/marketing/automated-campaign.svelte?raw';
	import AIAnalytics from '$lib/assets/svg/landing/feature-tabs/marketing/ai-analytics.svelte?raw';
	import MarketData from '$lib/assets/svg/landing/feature-tabs/insights/market-data.svelte?raw';
	import ComparableProperties from '$lib/assets/svg/landing/feature-tabs/insights/comparable-properties.svelte?raw';
	import NearbyPoi from '$lib/assets/svg/landing/feature-tabs/insights/nearby-poi.svelte?raw';
	import PropertyDescriptions from '$lib/assets/svg/landing/feature-tabs/listings/property-descriptions.svelte?raw';
	import ListingContent from '$lib/assets/svg/landing/feature-tabs/listings/listing-content.svelte?raw';
	import InstantExposure from '$lib/assets/svg/landing/feature-tabs/listings/instant-exposure.svelte?raw';
	import Navigation from '$lib/assets/svg/landing/feature-tabs/buyers/navigation.svelte?raw';
	import OptimizedOffer from '$lib/assets/svg/landing/feature-tabs/buyers/optimized-offer.svelte?raw';
	import SellerComfort from '$lib/assets/svg/landing/feature-tabs/buyers/seller-comfort.svelte?raw';

	const marketingTile1Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Marketing/landing-marketing-preview.png';
	const marketingTile2Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Marketing/landing-marketing-campaign.png';
	const marketingTile3Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Marketing/advanced-analytics-img.png';
	const insightsTile1Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Insights/tile1-img.png';
	const insightsTile2Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Insights/tile2-img.png';
	const insightsTile3Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Insights/tile3-img.png';
	const listingTile1Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Listings/tile1-img.png';
	const listingTile2Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Listings/tile2-img.png';
	const listingTile3Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Listings/tile3-img.png';
	const buyersTile1Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Buyers/tile1-img.png';
	const buyersTile2Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Buyers/tile2-img.png';
	const buyersTile3Img =
		'https://storage.googleapis.com/agentboost-dev/businessLogos/landing/Buyers/tile3-img.png';
	export let selectedTab: string;

	const tabInfoMap: Record<string, Record<string, Record<string, string>>> = {
		marketing: {
			tile1: {
				title: 'Automated Social Media',
				subTitle:
					'AI generated captions, video scripts, and auto posting across multiple platforms',
				img: marketingTile1Img,
				icon: LandingBezier
			},
			tile2: {
				title: 'Branded Campaigns',
				subTitle: 'Create and manage multi-channel campaigns',
				img: marketingTile2Img,
				icon: AutomatedCampaign
			},
			tile3: {
				title: 'Advanced Analytics and AI Generated Suggestions',
				subTitle: 'See your marketing effectiveness and progress with our analytics dashboard',
				img: marketingTile3Img,
				icon: AIAnalytics
			}
		},
		insights: {
			tile1: {
				title: 'Hyper Local Market Data',
				subTitle: `You're the expert in every neighberhood`,
				img: insightsTile1Img,
				icon: MarketData
			},
			tile2: {
				title: 'Nearby POIs',
				subTitle: 'Instantly see marketable locations that make your listings more valuable',
				img: insightsTile2Img,
				icon: NearbyPoi
			},
			tile3: {
				title: 'Comparable Properties',
				subTitle: 'Speed up the CMA process with our comparable property suggestions',
				img: insightsTile3Img,
				icon: ComparableProperties
			}
		},
		listings: {
			tile1: {
				title: 'Property Descriptions',
				subTitle:
					'With real property data, we take the guess work out of AI generated descriptions',
				img: listingTile1Img,
				icon: PropertyDescriptions
			},
			tile2: {
				title: 'Listing Generated Content',
				subTitle: 'Custom, on-brand content created to get more eyes on your listings',
				img: listingTile2Img,
				icon: ListingContent
			},
			tile3: {
				title: 'Instant Exposure',
				subTitle:
					'Make sure local agents know about your listings with our email blast capabilties',
				img: listingTile3Img,
				icon: InstantExposure
			}
		},
		buyers: {
			tile1: {
				title: 'Easy Showing Navigation and Scheduling',
				subTitle: 'Easily schedule your showings to go off without a hitch',
				img: buyersTile1Img,
				icon: Navigation
			},
			tile2: {
				title: 'Seller Comfort Level',
				subTitle: `Get insight into a seller's willingness to negotiate`,
				img: buyersTile2Img,
				icon: SellerComfort
			},
			tile3: {
				title: 'Optimized Offer',
				subTitle: 'Help your client get the best deal possible',
				img: buyersTile3Img,
				icon: OptimizedOffer
			}
		}
	};
</script>

<div class="flex w-full flex-col items-center justify-center">
	<div
		class="mt-8 w-full rounded-[20px] border border-white/5 p-1 sm:w-150 md:w-150 lg:w-200 xl:mt-16 xl:w-297"
	>
		<div
			class="flex h-full w-full flex-col items-center rounded-[18px] border border-white/10 bg-black/30 p-8 shadow backdrop-blur-[14.35px] sm:p-12 xl:h-122.5"
		>
			<div
				class="flex w-full flex-col items-start justify-start opacity-100 xl:flex-row xl:items-center xl:justify-center"
			>
				<div class="mr-4">
					{@html tabInfoMap[selectedTab.toLocaleLowerCase()].tile1.icon}
				</div>
				<p
					class="mt-4 text-xl tracking-tight text-white lg:whitespace-nowrap xl:mt-0 xl:text-[32px]"
				>
					{tabInfoMap[selectedTab.toLocaleLowerCase()].tile1.title}
				</p>
			</div>
			<p
				class="mt-4 w-full text-left text-base font-light text-[#C0C4DA] lg:whitespace-nowrap xl:text-center"
			>
				{tabInfoMap[selectedTab.toLocaleLowerCase()].tile1.subTitle}
			</p>
			<div class="mt-8 w-full">
				<img
					src={tabInfoMap[selectedTab.toLocaleLowerCase()].tile1.img}
					alt=""
					class="h-75 rounded-[18px] object-cover md:h-100 xl:h-full xl:w-full"
				/>
			</div>
		</div>
	</div>
</div>

<div class="mt-6 flex justify-center">
	<div
		class="flex w-full flex-col items-center justify-between sm:w-150 md:w-150 lg:w-200 xl:w-297 xl:flex-row"
	>
		<div class="rounded-[20px] border border-white/5 bg-zinc-950/0 p-1">
			<div
				class="h-full rounded-[18px] border border-white/10 bg-black/30 p-8 shadow backdrop-blur-[14.35px] sm:w-150 sm:p-8 md:w-150 lg:w-200 xl:h-149.5 xl:w-xl"
			>
				<div class="flex flex-col xl:flex-row xl:items-center">
					<div class="mr-4">
						{@html tabInfoMap[selectedTab.toLocaleLowerCase()].tile2.icon}
					</div>
					<p class="mt-4 text-xl tracking-tight text-white xl:mt-0 xl:text-[32px]">
						{tabInfoMap[selectedTab.toLocaleLowerCase()].tile2.title}
					</p>
				</div>
				<p class="mt-4 w-full text-left text-base font-light text-[#C0C4DA] lg:whitespace-nowrap">
					{tabInfoMap[selectedTab.toLocaleLowerCase()].tile2.subTitle}
				</p>
				<div class="mt-8">
					<img
						class="h-75 w-full rounded-[18px] object-cover mix-blend-lighten md:h-100 xl:h-83.75 xl:w-121.75"
						src={tabInfoMap[selectedTab.toLocaleLowerCase()].tile2.img}
						alt=""
					/>
				</div>
			</div>
		</div>
		<div class="mt-6 rounded-[20px] border border-white/5 bg-zinc-950/0 p-1 xl:mt-0">
			<div
				class="h-full rounded-[18px] border border-white/10 bg-black/30 p-8 shadow backdrop-blur-[14.35px] sm:w-150 sm:p-8 md:w-150 lg:w-200 xl:h-149.5 xl:w-xl"
			>
				<div class="flex flex-col xl:flex-row xl:items-center">
					<div class="relative w-full">
						<div class="float-left w-11.25">
							{@html tabInfoMap[selectedTab.toLocaleLowerCase()].tile3.icon}
						</div>
						<p class="mt-4 text-xl leading-8.75 tracking-tight text-white xl:mt-0 xl:text-[32px]">
							{tabInfoMap[selectedTab.toLocaleLowerCase()].tile3.title}
						</p>
					</div>
				</div>
				<p class="mt-4 w-full text-left text-base font-light text-[#C0C4DA] lg:whitespace-nowrap">
					{tabInfoMap[selectedTab.toLocaleLowerCase()].tile3.subTitle}
				</p>

				<div class="mt-8">
					<img
						class="h-75 w-full rounded-[18px] object-cover mix-blend-lighten md:h-100 xl:h-83.75 xl:w-121.75"
						src={tabInfoMap[selectedTab.toLocaleLowerCase()].tile3.img}
						alt=""
					/>
				</div>
			</div>
		</div>
	</div>
</div>

// SKYRAT NEGATIVE TRAITS

/datum/quirk/alexithymia
	name = "Alexithymia"
	desc = "You cannot accurately assess your feelings."
	value = -4
	mob_trait = TRAIT_MOOD_NOEXAMINE
	medical_record_text = "Patient is incapable of communicating their emotions."
	icon = FA_ICON_QUESTION_CIRCLE

/datum/quirk/fragile
	name = "Fragility"
	desc = "You feel incredibly fragile. Burns and bruises hurt you more than the average person!"
	value = -6
	medical_record_text = "Patient's body has adapted to low gravity. Sadly low-gravity environments are not conducive to strong bone development."
	icon = FA_ICON_TIRED

/datum/quirk/fragile/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.physiology.brute_mod *= 1.25
	user.physiology.burn_mod *= 1.2

/datum/quirk/fragile/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.physiology.brute_mod /= 1.25
	user.physiology.burn_mod /= 1.2

/datum/quirk/monophobia
	name = "Monophobia"
	desc = "You will become increasingly stressed when not in company of others, triggering panic reactions ranging from sickness to heart attacks."
	value = -6
	gain_text = span_danger("You feel really lonely...")
	lose_text = span_notice("You feel like you could be safe on your own.")
	medical_record_text = "Patient feels sick and distressed when not around other people, leading to potentially lethal levels of stress."
	icon = FA_ICON_PEOPLE_ARROWS_LEFT_RIGHT

/datum/quirk/monophobia/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.gain_trauma(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/monophobia/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user?.cure_trauma_type(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/no_guns
	name = "No Guns"
	desc = "For whatever reason, you are unable to use guns. The reasoning may vary, but is up to you to decide."
	gain_text = span_notice("You feel like you won't be able to use guns anymore...")
	lose_text = span_notice("You suddenly feel like you can use guns again!")
	medical_record_text = "Patient is unable to use firearms. Reasoning unknown."
	value = -6
	mob_trait = TRAIT_NOGUNS
	icon = FA_ICON_GUN

//BUBBER EDIT MOVE BEGIN - NEGATIVE SENSITIVE SNOUT
/datum/quirk/sensitivesnout
	name = "Sensitive Snout"
	desc = "Your snout has always been sensitive, and it really hurts when someone pokes it!"
	gain_text = span_notice("Your snout is awfully sensitive.")
	lose_text = span_notice("Your snout feels numb.")
	medical_record_text = "Patient's snout seems to have a cluster of nerves in the tip, would advise against direct contact."
	value = -2
	mob_trait = TRAIT_SENSITIVESNOUT
	icon = FA_ICON_FINGERPRINT

/datum/quirk/sensitivesnout/post_add()
	quirk_holder.apply_status_effect(/datum/status_effect/sensitivesnout)

/datum/quirk/sensitivesnout/remove()
	quirk_holder.remove_status_effect(/datum/status_effect/sensitivesnout)

/datum/status_effect/sensitivesnout
	id = "sensitivesnout"
	duration = -1
	alert_type = null

/datum/status_effect/sensitivesnout/get_examine_text()
	return span_warning("[owner.p_their(TRUE)] snout is rather bappable...")
// BUBBER EDIT MOVE END

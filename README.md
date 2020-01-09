
# Flags

# Manual Setting

These flags must be set manually by a mod.

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_CustomStatusAnimationEnabled | Character | Enables custom animations to play if the LeaderLib_CustomStatusAnimation var is set on the character. |
| LeaderLib_CustomStillAnimationEnabled | Character | Enables custom animations to play if the LeaderLib_CustomStillAnimation var is set on the character, when they go to play a still animation. |
| LeaderLib_Behavior_RandomArchetypesEnabled | Global | Makes NPC archetypes be randomly picked OnInit, using the AI's weapon type. |
| LeaderLib_Behavior_OnDamageEventsEnabled | Global | Makes all characters send CharacterCharacter and CharacterItem events when OnDamage fires. |
| LeaderLib_Behavior_OnDamageEventsEnabled | Character | Makes a character send CharacterCharacter and CharacterItem events when OnDamage fires. |
| LeaderLib_Behavior_SkipTurnOverrideEnabled | Global | Enables allowing a custom skip turn effect for all characters. |
| LeaderLib_Behavior_SkipTurnOverrideEnabled | Character | Enables setting a custom skip turn effect for a specific character. |

# Automatic Flags

These flags are automatically set by this mod.

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_Behavior_IsInvisible | Character | Used as a way to make all INVISIBLE type statuses considered in DefaultCharacter. |
| LeaderLib_Behavior_IsDisabled | Character | Used as a way to make all KNOCKED_DOWN, STUNNED, or other disabling status types considered in DefaultCharacter. |
| LeaderLib_Behavior_IsFloating | Character | ETHERAL_SOLES workaround for DefaultCharacter, allowing other FLOATING type statuses affect the script. Also makes the AI not avoid surfaces. |

# Tags

If these tags are set on the character, it affects their default behavior scripts.

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_Behavior_SeeThroughInvisiblity | Character | Makes the AI ignore invisibility for maximum metagaming. |

# Script Overrides

## Base.charScript

Inherited by every character (DefaultCharacter inherits this).

### New Behavior Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_CustomStatusAnimation | FIXEDSTRING | An animation to play if LeaderLib_CustomStatusAnimationEnabled is set. |
| LeaderLib_CustomStillAnimation | FIXEDSTRING | An animation to play if LeaderLib_CustomStillAnimationEnabled, instead of still. |

### New Behavior Events

| Name | Type | Description | Snippet |
| :--- | :--- | :--- | :--- |
| LeaderLib_OnAttackOfOpportunity | CharacterCharacter | Called when a character performs an Attack of Opportunity. | CharacterCharacterEvent(_Attacker, _Target, "LeaderLib_OnAttackOfOpportunity") |

## DefaultCharacter.charScript

Used by every character.

### New Behavior Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_Behavior_ForcedSkill | SKILL | An animation to play if LeaderLib_CustomStatusAnimationEnabled is set. |
| LeaderLib_CustomStillAnimation | FIXEDSTRING | An animation to play if LeaderLib_CustomStillAnimationEnabled, instead of still. |

### New Behavior Events

#### LeaderLib_OnDamage

Called when OnDamage fires.

```
StoryEvent((CHARACTERGUID)_Char, "LeaderLib_OnDamage")

CharacterCharacterEvent(_Target, _Source, "LeaderLib_OnDamage")

CharacterItemEvent(_Target, _Source, "LeaderLib_OnDamage")
```

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| ReceivedDamage.Source | CHARACTER | The source of the damage. |
| ReceivedDamage.DamageType | FIXEDSTRING/INTEGER | The damage type enum. |
| ReceivedDamage.DamagePercentage | FLOAT/REAL | Percentage of damage done, relative to the hit character. |
| ReceivedDamage.ItemSource | ITEM | The item source of the damage. Can be null. |

#### LeaderLib_AI_CharacterAiFetchSaveActionPointsCommand

Called when CharacterAiFetchSaveActionPointsCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_SaveActionPoints.TargetPosition | FLOAT3 | The position to move to. |
| Combat_AI_SaveActionPoints.EndPosition | FLOAT3 | The position to stop at prematurely. |
| Combat_AI_SaveActionPoints.SkipTurnEffect | STRING | The effect to play if the AI skips its turn. Default: RS3_FX_UI_Icon_SkipTurn_01 |
| Combat_AI_SaveActionPoints.SkipTurnBone | FIXEDSTRING | The bone to play the above effect on. Default: Dummy_OverheadFX |

#### LeaderLib_AI_CharacterAiFetchSaveActionPointsCommand

Called when CharacterAiFetchSaveActionPointsCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_Fallback.TargetPosition | FLOAT3 | The position to move to. |
| Combat_AI_Fallback.EndPosition | FLOAT3 | The position to stop at prematurely. |
| Combat_AI_Fallback.FallbackADDialog | STRING | The automated dialog to play when saving AP. |

#### LeaderLib_AI_CharacterAiFetchAttackCommand

Called when CharacterAiFetchAttackCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_Attack.TargetPosition | FLOAT3 | The position to move to. |
| Combat_AI_Attack.EndPosition | FLOAT3 | The position to stop at prematurely. |
| Combat_AI_Attack.TargetCharacter | CHARACTER | The target character to attack. |
| Combat_AI_Attack.TargetItem | ITEM | The target item to attack. |

#### LeaderLib_AI_CharacterAiFetchConsumeCommand

Called when CharacterAiFetchConsumeCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_Consume.Item | ITEM | The item to use. |

#### LeaderLib_AI_CharacterAiFetchSkillCommand

Called when CharacterAiFetchSkillCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_CastSkill.Skill | SKILL | The skill to cast. |
| Combat_AI_CastSkill.SkillItem | ITEM | The item the skill may be coming from. |
| Combat_AI_CastSkill.EndPosition | FLOAT3 | The position to move to. |
| Combat_AI_CastSkill.TargetPos1 | FLOAT3 | The position to use the skill on. |
| Combat_AI_CastSkill.TargetPos2 | FLOAT3 | The position to use the skill on. |
| Combat_AI_CastSkill.TargetCharacter1 | CHARACTER | The character to move to or use the skill on. |
| Combat_AI_CastSkill.TargetCharacter2 | CHARACTER | The character to use the skill on. |
| Combat_AI_CastSkill.TargetItem1 | ITEM | The item to move to or use the skill on. |
| Combat_AI_CastSkill.TargetItem2 | ITEM | The item use the skill on. |

#### LeaderLib_AI_CharacterAiFetchMoveSkillCommand

Called when CharacterAiFetchMoveSkillCommand fires.

##### Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| Combat_AI_CastSkill.Skill | SKILL | The skill to cast. |
| Combat_AI_CastSkill.SkillItem | ITEM | The item the skill may be coming from. |
| Combat_AI_CastSkill.TargetPos | FLOAT3 | The position to use the skill on. |

### Misc Events

| Name | Type | Description | Snippet |
| :--- | :--- | :--- | :--- |
| LeaderLib_GetSkipTurnEffect | Character | Called if the LeaderLib_Behavior_SkipTurnOverrideEnabled flag is set globally or on a character. Set LeaderLib_SkipTurnEffect.Effect and LeaderLib_SkipTurnEffect.Bone | StoryEvent(_Char_, "LeaderLib_GetSkipTurnEffect") |
| LeaderLib_GetRandomArchetype | Character | Called when a an AI is about to set a random archetype. Set the Archetype FIXEDSTRING to override the result. | StoryEvent(_Npc, "LeaderLib_GetRandomArchetype") |
| LeaderLib_SetArchetype | Character | Call to make a character set their Archetype to their Archetype var. | SetStoryEvent(_Npc, "LeaderLib_SetArchetype"); |

## Player.charScript

Used by every player character.

### New Global Vars

| Name | Type | Description |
| :--- | :--- | :--- |
| LeaderLib_CustomCCAnimation | SKILL | An animation to play in CC if LeaderLib_CustomCCAnimationEnabled is set. |
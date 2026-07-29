import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : Real -> Real
  survivalFunction : Real -> Real
  censoringMechanism : Prop
  proportionalHazards : Prop
  nonInformativeCensoring : Prop
  censoringMechanismTerm : censoringMechanism
  proportionalHazardsTerm : proportionalHazards
  nonInformativeCensoringTerm : nonInformativeCensoring

structure SurvivalModelEvidence (S : SurvivalModel) where
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsClosed : S.proportionalHazards
  nonInformativeCensoringClosed : S.nonInformativeCensoring

def SurvivalModelClosed (S : SurvivalModel) : Prop :=
  S.censoringMechanism ∧ S.proportionalHazards ∧ S.nonInformativeCensoring

theorem survival_model_closed_from_evidence (S : SurvivalModel)
    (E : SurvivalModelEvidence S) : SurvivalModelClosed S := by
  exact And.intro E.censoringMechanismClosed
    (And.intro E.proportionalHazardsClosed E.nonInformativeCensoringClosed)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
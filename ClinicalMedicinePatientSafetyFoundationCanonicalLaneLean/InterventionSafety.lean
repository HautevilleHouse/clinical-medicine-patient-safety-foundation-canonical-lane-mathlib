import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure InterventionSafetyModel where
  interventionId : String
  adverseEventRate : Float
  relativeRisk : Float
  numberNeededToHarm : Float
  riskDifference : Float
  patientStratification : List String

define InterventionSafetyClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem intervention_safety_endgame (A : AdmissibleClass) : InterventionSafetyClosed A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
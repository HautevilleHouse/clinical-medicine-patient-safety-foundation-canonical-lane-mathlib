import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure AdverseEventModel where
  patientId : String
  eventType : String
  severityScore : Float
  timeOfEvent : Float
  contributingFactors : List String
  outcome : Prop

define AdverseEventClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem adverse_event_endgame (A : AdmissibleClass) : AdverseEventClosed A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
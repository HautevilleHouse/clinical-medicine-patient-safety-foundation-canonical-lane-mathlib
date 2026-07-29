import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure DosingRegimen (D : Type) where
  drug : D
  dose : ℝ
  interval : ℝ
  route : String

def dosingProtocolClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

theorem dosing_protocol_endgame (A : AdmissibleClass) :
    dosingProtocolClosed A := by
  exact And.intro A.endpointSatisfied A.remainderRecorded

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
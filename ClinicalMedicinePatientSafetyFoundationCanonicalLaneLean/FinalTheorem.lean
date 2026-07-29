import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

def ConstrainedPatientSafetyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_patient_safety_endgame (A : AdmissibleClass) :
    ConstrainedPatientSafetyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
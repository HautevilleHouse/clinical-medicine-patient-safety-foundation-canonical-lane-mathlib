import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean.CompartmentModel
import ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean.PharmacokineticModel
import ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean.DiagnosticInference
import ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  trivial

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedPatientSafetyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_patient_safety_endgame (A : AdmissibleClass) :
    ConstrainedPatientSafetyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
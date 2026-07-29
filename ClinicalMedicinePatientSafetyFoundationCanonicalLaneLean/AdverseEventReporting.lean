import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure PatientAdmission (A : Type) where
  id : A
  eventReported : Prop
  eventReviewed : Prop
  outcomeTracked : Prop

def adverseEventClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
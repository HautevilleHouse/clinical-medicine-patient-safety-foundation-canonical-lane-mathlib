import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure PatientSafetyAdmittedObject where
  patientId : Type
  medicalRecord : Type
  diagnosisValidated : Prop
  treatmentPlanMonitored : Prop
  outcomeMeasured : Prop
  conclusion : outcomeMeasured

structure PatientSafetyAdmissibleClass extends AdmissibleClass where
  object : PatientSafetyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded
  bridgeProof : object.conclusion → bridgeClosed this

def patientSafetyAdmittedClosure (A : PatientSafetyAdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse
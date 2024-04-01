from django.db import models

# Create your models here.

class Prescription(models.Model):
    prescription_id = models.IntegerField
    doctor_id = models.IntegerField
    patient_id = models.IntegerField
    medicine_name = models.CharField(max_length=30)
    dosage_desc = models.CharField(max_length=30)
    prescription_fee = models.FloatField
    additional_notes = models.CharField(max_length=255)
    
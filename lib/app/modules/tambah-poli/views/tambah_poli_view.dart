import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_poli_controller.dart';

class TambahPoliView extends GetView<TambahPoliController> {
  const TambahPoliView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Text(
                    'Tambah Jadwal Poli',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Expanded(
                child: SingleChildScrollView(
                  child: TambahPoliForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TambahPoliForm extends StatefulWidget {
  const TambahPoliForm({super.key});

  @override
  _TambahPoliFormState createState() => _TambahPoliFormState();
}

class _TambahPoliFormState extends State<TambahPoliForm> {
  final controller = Get.put(TambahPoliController());
  final _formKey = GlobalKey<FormState>();



  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.selectedDate) {
      setState(() {
        controller.selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: <Widget>[
              _buildTextField(
                controller: controller.namaDokterController,
                label: 'Nama Dokter',
              ),
              _buildTextField(
                controller: controller.spesialisController,
                label: 'Spesialis',
              ),
              _buildDatePickerField(context),
              _buildTextField(
                controller: controller.lokasiController,
                label: 'Lokasi',
              ),
              _buildTextField(
                controller: controller.kontakController,
                label: 'Kontak',
              ),
              _buildTextField(
                controller: controller.informasiTambahanController,
                label: 'Informasi Tambahan',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    controller.tambahPoli();
                  }
                },
                child: Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePickerField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Jam Praktek',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.selectedDate == null
                    ? 'Select Date'
                    : '${controller.selectedDate!.day}/${controller.selectedDate!.month}/${controller.selectedDate!.year}',
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }
}

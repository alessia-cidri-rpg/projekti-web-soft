<?php
include 'db_connect.php'; // lidhja me databazen

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $titulli = $_POST['titulli'];
    $kohezgjatja = $_POST['kohezgjatja'];
    $data = $_POST['data']; // Viti
    $status_id = $_POST['status_id'];
    $pershkrimi = $_POST['pershkrimi'];
    $posteri = $_POST['posteri'];
    $header_poster = $_POST['header_poster'];
    $data_kinema = $_POST['data_kinema'];

    // Marrim listat e përzgjedhura nga checkboxes (nëse nuk ka zgjedhur asnjë, mbeten lista bosh [])
    $zhanret_e_zgjedhura = $_POST['zhanret'] ?? [];
    $aktoret_per_lidhje = $_POST['aktoret'] ?? [];

    // 1. LOGJIKA E REGJISORIT (Ekzistues apo i Ri)
    $regjisor_id = $_POST['regjisor_id'] ?? '';

    // Nëse Admini ka shkruar një emër të ri regjisori
    if (!empty($_POST['regjisor_i_ri'])) {
        $emri_regj_ri = trim($_POST['regjisor_i_ri']);

        // Kontrollojmë mos ekziston një herë në DB për siguri
        $check_regj = $conn->prepare("SELECT regjisor_id FROM regjisor WHERE regjisor_emri = ?");
        $check_regj->bind_param("s", $emri_regj_ri);
        $check_regj->execute();
        $res_regj = $check_regj->get_result();

        if ($res_regj->num_rows > 0) {
            // Nëse ekziston, marrim ID-në e tij ekzistuese
            $row_regj = $res_regj->fetch_assoc();
            $regjisor_id = $row_regj['regjisor_id'];
        } else {
            // Nëse është krejtësisht i ri, e ruajmë në tabelën 'regjisor'
            $ins_regj = $conn->prepare("INSERT INTO regjisor (regjisor_emri) VALUES (?)");
            $ins_regj->bind_param("s", $emri_regj_ri);
            $ins_regj->execute();
            
            // ID-ja e re që u krijua automatikisht
            $regjisor_id = $conn->insert_id; 
            $ins_regj->close();
        }
        $check_regj->close();
    }

    // Sigurohemi që kemi një regjisor ID përpara se të vazhdojmë
    if (empty($regjisor_id)) {
        die("Ju lutem zgjedhni ose shkruani një regjisor!");
    }

    // 2. FUSIM FILMIN NË TABELË
    $sql = "INSERT INTO filmi 
        (regjisor_id, titulli, kohezgjatja, data, pershkrimi, posteri, header_poster, status_id, data_kinema) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $queryStatement = $conn->prepare($sql);
    $queryStatement->bind_param("ississsis", 
        $regjisor_id, $titulli, $kohezgjatja, $data, $pershkrimi, $posteri, $header_poster, $status_id, $data_kinema
    );

    // Këtu ekzekutohet VETËM NJË HERË brenda kushtit if
    if ($queryStatement->execute()) {
        // Kapim ID-në e filmit që sapo u krijua
        $filmi_id_ri = $conn->insert_id;

        // 3. Ruajmë zhanret te tabela ndërmjetëse 'zhanri_filmi'
        if (!empty($zhanret_e_zgjedhura)) {
            $stmt_zhanri = $conn->prepare("INSERT INTO zhanri_filmi (filmi_id, zhanri_id) VALUES (?, ?)");
            foreach ($zhanret_e_zgjedhura as $zhanri_id) {
                $stmt_zhanri->bind_param("ii", $filmi_id_ri, $zhanri_id);
                $stmt_zhanri->execute();
            }
            $stmt_zhanri->close();
        }

        // 4. KONTROLLOJMË NËSE KA SHTUAR AKTORË TË RINJ TE FUSHA E TEKSTIT
        if (!empty($_POST['aktore_te_rinj'])) {
            $aktoret_rinj_array = explode(',', $_POST['aktore_te_rinj']);
            
            foreach ($aktoret_rinj_array as $emor_aktor) {
                $emor_aktor = trim($emor_aktor); 
                
                if ($emor_aktor !== '') {
                    $check_akt = $conn->prepare("SELECT aktor_id FROM aktore WHERE aktor_emri = ?");
                    $check_akt->bind_param("s", $emor_aktor);
                    $check_akt->execute();
                    $res_akt = $check_akt->get_result();
                    
                    if ($res_akt->num_rows > 0) {
                        $row_akt = $res_akt->fetch_assoc();
                        $aktoret_per_lidhje[] = $row_akt['aktor_id'];
                    } else {
                        $ins_akt = $conn->prepare("INSERT INTO aktore (aktor_emri) VALUES (?)");
                        $ins_akt->bind_param("s", $emor_aktor);
                        $ins_akt->execute();
                        
                        $aktoret_per_lidhje[] = $conn->insert_id;
                        $ins_akt->close();
                    }
                    $check_akt->close();
                }
            }
        }

        // 5. Ruajmë të gjithë aktorët (e vjetër + të rinj) te tabela ndërmjetëse 'aktori_filmi'
        if (!empty($aktoret_per_lidhje)) {
            $stmt_aktori = $conn->prepare("INSERT INTO aktori_filmi (filmi_id, aktor_id) VALUES (?, ?)");
            foreach ($aktoret_per_lidhje as $aktor_id) {
                $stmt_aktori->bind_param("ii", $filmi_id_ri, $aktor_id);
                $stmt_aktori->execute();
            }
            $stmt_aktori->close();
        }

        // Çdo gjë u krye me sukses, kthehemi te paneli i adminit
        header("Location: admin.php");
        exit;
    } else {
        echo "Error: " . $queryStatement->error;
    }

    $queryStatement->close();
}
$conn->close();
?>
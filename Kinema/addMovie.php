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

    //qe te merren el. e zgjedhur nga checkboxet
    $zhanret_e_zgjedhura = $_POST['zhanret'] ?? [];
    $aktoret_per_lidhje = $_POST['aktoret'] ?? [];

    // regjisori a eshte i ri apo ka qene ne databaze
    $regjisor_id = $_POST['regjisor_id'] ?? '';

    // nese i ri
    if (!empty($_POST['regjisor_i_ri'])) {
        $emri_regj_ri = trim($_POST['regjisor_i_ri']);

        // e kontrollojm edhe iher mos eshte ne databaze
        $check_regj = $conn->prepare("SELECT regjisor_id FROM regjisor WHERE regjisor_emri = ?");
        $check_regj->bind_param("s", $emri_regj_ri);
        $check_regj->execute();
        $res_regj = $check_regj->get_result();

        if ($res_regj->num_rows > 0) {
            // nese gjendet, ti merret id-ja
            $row_regj = $res_regj->fetch_assoc();
            $regjisor_id = $row_regj['regjisor_id'];
        } else {
            // nese me verte i ri, ti jepet nje id
            $ins_regj = $conn->prepare("INSERT INTO regjisor (regjisor_emri) VALUES (?)");
            $ins_regj->bind_param("s", $emri_regj_ri);
            $ins_regj->execute();
            
            // id-ja e re, jepet automatikisht ngaqe ne databzae eshte auto_increment
            $regjisor_id = $conn->insert_id; 
            $ins_regj->close();
        }
        $check_regj->close();
    }

    // te sigurohemi qe u mor id-ja e regjisorit
    if (empty($regjisor_id)) {
        die("Please choose or type the director's name!");
    }

    // insert filmin ne tabele
    $sql = "INSERT INTO filmi 
        (regjisor_id, titulli, kohezgjatja, data, pershkrimi, posteri, header_poster, status_id, data_kinema) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $queryStatement = $conn->prepare($sql);
    $queryStatement->bind_param("ississsis", 
        $regjisor_id, $titulli, $kohezgjatja, $data, $pershkrimi, $posteri, $header_poster, $status_id, $data_kinema
    );

    
    if ($queryStatement->execute()) {
        // marrim id-ne e filmit qe sapo krijuam
        $filmi_id_ri = $conn->insert_id;

        // ruajm zhanret te tabela ndermjetesja zhanri_film
        if (!empty($zhanret_e_zgjedhura)) {
            $stmt_zhanri = $conn->prepare("INSERT INTO zhanri_filmi (filmi_id, zhanri_id) VALUES (?, ?)");
            foreach ($zhanret_e_zgjedhura as $zhanri_id) {
                $stmt_zhanri->bind_param("ii", $filmi_id_ri, $zhanri_id);
                $stmt_zhanri->execute();
            }
            $stmt_zhanri->close();
        }

        // check a jane shtuar aktore te rinj, edhe nese vendosen disa emra ne input field-in, merren se bashku edhe shtohen nje nga nje
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

        // 5ruhen dhe aktoret te tabela ndermjetese aktoret_filmi
        if (!empty($aktoret_per_lidhje)) {
            $stmt_aktori = $conn->prepare("INSERT INTO aktori_filmi (filmi_id, aktor_id) VALUES (?, ?)");
            foreach ($aktoret_per_lidhje as $aktor_id) {
                $stmt_aktori->bind_param("ii", $filmi_id_ri, $aktor_id);
                $stmt_aktori->execute();
            }
            $stmt_aktori->close();
        }

        // me sukses kthehemi te admini
        header("Location: admin.php");
        exit;
    } else {
        echo "Error: " . $queryStatement->error;
    }

    $queryStatement->close();
}
$conn->close();
?>
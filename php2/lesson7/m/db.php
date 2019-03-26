<?php
/**
 * Created by PhpStorm.
 * User: dimon
 * Date: 10.03.2019
 * Time: 9:26
 */

class db
{
    private $db;

    public function __construct()
    {
        $this->getDB();
    }

    public function getDB(){
        $connectString = DB_DRIVER.':host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=UTF8;';
        $this->db = new PDO($connectString, DB_USER, DB_PASS,
            [
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            ]
        );
    }

    public function select($table,$where,$whereValue){
        return $this->db->query("SELECT * FROM $table WHERE $where = '$whereValue'")->fetch();
    }

    public function selectAll($table,$where,$whereValue){
        return $this->db->query("SELECT * FROM $table WHERE $where = '$whereValue'")->fetchAll();
    }

    public function selectLimit($table,$startRow,$rowCount){
        return $this->db->query("SELECT * FROM $table LIMIT $startRow, $rowCount")->fetchAll();
    }

    public function selectJoin($table,$startRow,$rowCount){
        return $this->db->query("SELECT * FROM $table LIMIT $startRow, $rowCount")->fetchAll();
    }

    public function update($table,$set,$setValue,$where,$whereValue){
        return $this->db->exec("UPDATE `$table` SET `$set`='$setValue' WHERE '$where' = '$whereValue'");
    }

    public function insert($table,$fields,$values){
        return $this->db->exec("INSERT INTO '$table' ('') VALUES ()");
    }
}
<template>
  <el-table
    :data="users"
    style="width: 100%">
    <el-table-column
      prop="user.nickname"
      label="Date"
      width="180">
    </el-table-column>
    <el-table-column
      prop="name"
      label="Name"
      width="180">
    </el-table-column>
    <el-table-column
      prop="address"
      label="Address">
    </el-table-column>
  </el-table>
</template>
<script>
import axios from 'axios'
  export default {
    data() {
      return {
        users: []
      }
    },
    created() {
      axios.get('/api/v1/books')
       .then(res => {
         this.users = res.data
       })
    }

  }
</script>
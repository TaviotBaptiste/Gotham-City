<template>

  <Splitter style="height: 800px" layout="vertical">
    <SplitterPanel>
      <Splitter>
        <SplitterPanel>
          <barChart></barChart>
        </SplitterPanel>
        <SplitterPanel>
          <linechart></linechart>
        </SplitterPanel>
      </Splitter>
    </SplitterPanel>
    <SplitterPanel>
      <pieChart></pieChart>
    </SplitterPanel>
  </Splitter>


</template>
  
  
<script setup>
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
import Splitter from 'primevue/splitter';
import SplitterPanel from 'primevue/splitterpanel';
import barChart from './charts/barchart';
import linechart from './charts/linechart';
import pieChart from './charts/piechart';


</script>

<style>
</style>
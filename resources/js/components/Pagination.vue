<template>
<ul class="nav justify-content-center">
    <li v-for="page in pages">
            <button class="btn" @click.prevent="changePage(page)" :class="{current: current == page }">
              {{ page }}
            </button>
          </li>
</ul>
</template>

<script>
export default {
    props: {
    current: {
      type: Number,
      default: 1
    },
    total: {
      type: Number,
      default: 0
    },
    pageRange: {
      type: Number,
      default: 2
    }
  },
  computed: {
    pages: function() {
      var pages = []
      for(var i = this.rangeStart; i <= this.rangeEnd; i++) {
        pages.push(i)
      }

      return pages
    },
    rangeStart: function() {
      var start = this.current - this.pageRange

      return (start > 0) ? start : 1
    },
    rangeEnd: function() {
      var end = this.current + this.pageRange

      return (end < this.total) ? end : this.total
    },
    nextPage: function() {
      return this.current + 1
    },
    prevPage: function() {
      return this.current - 1
    }
  },
  methods: {
    hasFirst: function() {
      return this.rangeStart !== 1
    },
    hasLast: function() {
      return this.rangeEnd < this.totalPages
    },
    hasPrev: function() {
      return this.current > 1
    },
    hasNext: function() {
      return this.current < this.totalPages
    },
    changePage: function(page) {
      this.$emit('page-changed', page)
    }
  }
}
</script>

<style>
.current{
    border:  1px solid green;
}
</style>

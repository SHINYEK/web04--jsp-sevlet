   function pagination(total, size) { 
       let totalCount = total;
       let pageSize = size;
       let pageNumber = 1;
       let _totalPages = totalCount / pageSize
       if (totalCount % pageSize > 0) _totalPages++;

       $('#pagination').twbsPagination({
           startPage: 1,
           totalPages: _totalPages,
           visiblePages: 5,
           first: '<span sris-hidden="true">«</span>',
           last: '<span sris-hidden="true">»</span>',
           prev: "&lt;",
           next: "&gt;",
           onPageClick: function(event, page) {
               getList(page);
           }
       });
   }
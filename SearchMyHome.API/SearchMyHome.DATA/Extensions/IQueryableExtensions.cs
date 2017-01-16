using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Dynamic;

namespace SearchMyHome.DATA.Extensions
{
    public static class IQueryableExtensions
    { 
        public static IQueryable<T> ApplySort<T>(this IQueryable<T> source,string sort)
        {
            if (source == null) {
                throw new ArgumentNullException("source is null");
            }

            if (source == null) {
                return source;
            }

            string[] sortParameters = sort.Split(',');

            string completeSortExpression = string.Empty;

            foreach (string sortOption in sortParameters)
            {
                if (sortOption.StartsWith("-"))
                {
                    completeSortExpression = completeSortExpression + sortOption.Remove(0, 1) + " descending,";
                }
                else {
                    completeSortExpression = completeSortExpression + sortOption + ",";
                }

                if (!string.IsNullOrWhiteSpace(completeSortExpression)) {
                    source = source
                        .OrderBy(completeSortExpression
                        .Remove(completeSortExpression
                        .Count() - 1));
                }
            }
            return source;

        }
    }
}

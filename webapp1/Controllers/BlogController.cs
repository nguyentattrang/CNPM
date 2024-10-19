using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApp1.Models;
using X.PagedList.Extensions;

namespace WebApp1.Controllers
{
    public class BlogController : Controller
    {
        private readonly DataContext _context;
        public BlogController(DataContext context)
        {
            _context = context;
        }
        public IActionResult Index(int? page)
        {
            if (page == null) page = 1;
            int pageSize = 1;
            var blogs = _context.Blogs.Where(i => (bool)i.IsActive).OrderByDescending(i => i.BlogID).ToPagedList((int)page, pageSize);
            ViewBag.blogComment = _context.BlogComments.ToList();
            return View(blogs);
        }
        [Route("/blog/{alias}-{id}.html")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Blogs == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs
                .FirstOrDefaultAsync(m => m.BlogID == id);
            if (blog == null)
            {
                return NotFound();
            }

            ViewBag.blogComment = _context.BlogComments
                .Include(c => c.Account)
                .Where(i => i.BlogID == id)
                .ToList();

            return View(blog);
        }
    }
}

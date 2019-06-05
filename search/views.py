import sys
sys.path.append("..")


from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import render
from wagtail.core.models import Page
from wagtail.search.models import Query
from django.utils import timezone

from home.models import Noticia

def search(request):
    search_query = request.POST.get('busqueda', None)
    page = request.GET.get('page', 1)

    # Search
    if search_query:
        search_results = Noticia.objects.live().exclude(expire_at__lt=timezone.now())
        search_results = search_results.exclude(go_live_at__gt=timezone.now())
        search_results = search_results.order_by("-date")
        search_results = search_results.search(search_query)
        query = Query.get(search_query)

        # Record hit
        query.add_hit()
    else:
        search_results = Page.objects.none()

    # Pagination
    paginator = Paginator(search_results, 10)
    try:
        search_results = paginator.page(page)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    return render(request, 'search/search.html', {
        'search_query': search_query,
        'search_results': search_results,
    })

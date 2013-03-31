# $MidnightBSD: mports/textproc/libxml2/Makefile,v 1.14 2013/03/02 20:03:25 laffer1 Exp $

PORTNAME=	libxml2
PORTVERSION=	2.8.0
PORTREVISION?=	0
CATEGORIES?=	textproc gnome
MASTER_SITES=	ftp://xmlsoft.org/libxml2/ \
		ftp://gd.tuwien.ac.at/pub/libxml/
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	XML parser library for GNOME
LICENSE=	bsd3

.if !defined(REFERENCE_PORT)

USE_CSTD=	gnu89
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
USE_GNOME?=	gnomehack
USE_PKGCONFIG=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS?=--with-iconv=${LOCALBASE} \
		--with-html-dir=${PREFIX}/share/doc \
		--with-html-subdir=${PORTNAME} \
		--without-python
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.if !defined(MASTERDIR)
MAN1=		xml2-config.1 xmllint.1 xmlcatalog.1
MAN3=		libxml.3

OPTIONS_DEFINE= SCHEMA THREADS MEM_DEBUG XMLLINT_HIST THREAD_ALLOC
OPTIONS_DEFAULT=SCHEMA THREADS
SCHEMA_DESC=	XML schema support
THREADS_DESC=	Threads support
MEM_DEBUG_DESC= Memory debugging (DEVELOPERS ONLY!)
XMLLINT_HIST_DESC= History for xmllint
THREAD_ALLOC_DESC= Per-thread memory (DEVELOPERS ONLY!)

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MSCHEMA}
CONFIGURE_ARGS+=	--without-schemas
.endif

.if ! ${PORT_OPTIONS:MTHREADS}
CONFIGURE_ARGS+=	--without-threads
.endif

.if ${PORT_OPTIONS:MMEM_DEBUG}
CONFIGURE_ARGS+=	--with-mem-debug
.endif

.if ${PORT_OPTIONS:MXMLLINT_HIST}
CONFIGURE_ARGS+=	--with-history
.endif

.if ${PORT_OPTIONS:MTHREAD_ALLOC}
CONFIGURE_ARGS+=	--with-thread-alloc
.endif
.endif # !defined(MASTERDIR)

post-patch:
.for d in . doc doc/devhelp doc/examples
	@${REINPLACE_CMD} -e '/^install-data-am:/ s|install-data-local||' \
		${WRKSRC}/${d}/Makefile.in
.endfor
.for f in catalog.c xmlcatalog.c xmllint.c doc/xmllint.1
	@${REINPLACE_CMD} -e \
		's|/etc/xml/catalog|${LOCALBASE}/share/xml/catalog|g; \
		 s|/etc/sgml/catalog|${LOCALBASE}/share/sgml/catalog|g' ${WRKSRC}/${f}
.endfor

.include <bsd.port.mk>

.endif



PORTNAME=	st
PORTVERSION=	1.9
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}ate-threads/${PORTNAME}ate-threads/${PORTVERSION}

MAINTAINER=	ports@midnightBSD.org
COMMENT=	State Threads Library for Internet Applications
LICENSE=	mpl

USE_LDCONFIG=	yes

DOCS=		fig.gif notes.html reference.html st.html \
		timeout_heap.txt
EXAMPLES=	Makefile README error.c lookupdns.c proxy.c \
		res.c server.c

.include <bsd.port.pre.mk>

post-patch:
	@${RM} -f ${WRKSRC}/Makefile ${WRKSRC}/examples/Makefile
	@${CP} ${FILESDIR}/Makefile.main ${WRKSRC}/Makefile
	@${CP} ${FILESDIR}/Makefile.examples ${WRKSRC}/examples/Makefile

post-install:
	@${CP} ${WRKSRC}/public.h ${PREFIX}/include/st.h
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/docs/,} ${DOCSDIR}/
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${EXAMPLES:S,^,${WRKSRC}/examples/,} ${EXAMPLESDIR}/
.endif

.include <bsd.port.post.mk>

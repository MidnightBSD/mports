PORTNAME=	st
PORTVERSION=	1.9
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}ate-threads/${PORTNAME}ate-threads/${PORTVERSION}

MAINTAINER=	ports@midnightBSD.org
COMMENT=	State Threads Library for Internet Applications
WWW=		https://state-threads.sourceforge.net/

LICENSE=	MPL20

USES=		uidfix
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64

DOCS=		fig.gif notes.html reference.html st.html \
		timeout_heap.txt
EXAMPLES=	Makefile README error.c lookupdns.c proxy.c \
		res.c server.c

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
	@${RM} -f ${WRKSRC}/Makefile ${WRKSRC}/examples/Makefile
	@${CP} ${FILESDIR}/Makefile.main ${WRKSRC}/Makefile
	@${CP} ${FILESDIR}/Makefile.examples ${WRKSRC}/examples/Makefile

post-install:
	${INSTALL_DATA} ${WRKSRC}/public.h ${STAGEDIR}${PREFIX}/include/st.h
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/docs/,} ${STAGEDIR}${DOCSDIR}/
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${EXAMPLES:S,^,${WRKSRC}/examples/,} \
		${STAGEDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>

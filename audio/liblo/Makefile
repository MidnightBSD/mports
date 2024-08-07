

PORTNAME=	liblo
PORTVERSION=	0.28
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Open Sound Control implementation

LICENSE=	lgpl2.1

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix
USE_LDCONFIG=	yes

PORTDOCS=	*
PORTEXAMPLES=	example_client example_server \
		example_tcp_echo_server nonblocking_server_example

OPTIONS_DEFINE=	DOXYGEN DOCS EXAMPLES
OPTIONS_SUB=	yes

DOXYGEN_BUILD_DEPENDS=	doxygen:${PORTSDIR}/devel/doxygen

.include <bsd.mport.options.mk>

post-patch:
.if ${ARCH} == i386
	@${REINPLACE_CMD} -e 's,deadbeef,, ; s,f00baa23,,' \
		${WRKSRC}/lo/lo_macros.h
.endif

post-install:
	@${MKDIR} ${DOCSDIR}
.for f in AUTHORS ChangeLog NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.if ${PORT_OPTIONS:MDOXYGEN}
	(cd ${WRKSRC}/doc/man/man3 && ${INSTALL_MAN} l*.3 p*.3 \
		${STAGEDIR}${MAN3PREFIX}/man/man3/)
	(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} html ${STAGEDIR}${DOCSDIR})
.endif
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${PORTEXAMPLES:S|^|${WRKSRC}/examples/|} \
		${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>

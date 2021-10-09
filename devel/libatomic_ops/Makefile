

PORTNAME=	libatomic_ops
DISTVERSION=	7.4.16
CATEGORIES=	devel
MASTER_SITES=	https://github.com/ivmai/libatomic_ops/releases/tag/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Atomic operations access library

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		libtool pathfix

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
# Inhibit installation of extra copy of GPL
	@${REINPLACE_CMD} -E 's,: (un)?install-dist_pkgdataDATA,:,' \
		${WRKSRC}/Makefile.in
.if ${PORT_OPTIONS:MDOCS}
# Fix documentation installation directory
	@${REINPLACE_CMD} -e 's,pkgdata,pkgdoc,g ; s,(datadir.*,(docdir),' \
		${WRKSRC}/doc/Makefile.in
.else
# If documentation is not wanted, just disable it instead of fixing
	@${REINPLACE_CMD} -E 's,: (un)?install-dist_pkgdataDATA,:,' \
		${WRKSRC}/doc/Makefile.in
.endif

.include <bsd.port.mk>

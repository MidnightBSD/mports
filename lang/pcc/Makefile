# Ports collection makefile for:  pcc
# Date created:			  May 12, 2008
# Whom:				  Lucas Holt <luke@midnightbsd.org>

PORTNAME=	pcc
PORTVERSION=	1.1.0
PORTREVISION?=	1
CATEGORIES=	lang
MASTER_SITES=	ftp://pcc.ludd.ltu.se/pub/pcc-releases/ \
		http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/ \
		ftp://226.net120.skekraft.net/pcc-releases/
DISTNAME=	pcc-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Portable C Compiler
WWW=		http://pcc.ludd.ltu.se/

LICENSE=	BSDCOMPATIBLE bsd2 bsd3
LICENSE_COMB=	multi
LICENSE_NAME_BSDCOMPATIBLE=	BSD-style compatible licenses
LICENSE_TEXT_BSDCOMPATIBLE=	The license: BSDCOMPATIBLE (${LICENSE_NAME_BSDCOMPATIBLE}),\
	please read from the web: http://pcc.ludd.ltu.se/licenses/
LICENSE_PERMS_BSDCOMPATIBLE=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

RUN_DEPENDS=	pcc-libs>=${PORTVERSION}:devel/pcc-libs

ONLY_FOR_ARCHS=	i386 amd64

USES=		gmake tar:tgz
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	YACC=${YACC}

PLIST_FILES=	bin/pcc bin/pcpp \
		libexec/ccom libexec/cxxcom libexec/cpp \
		man/man1/ccom.1.gz man/man1/cpp.1.gz \
		man/man1/pcc.1.gz

MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	THREADS
OPTIONS_DEFAULT=	THREADS
THREADS_DESC=	Enable Thread-local storage (TLS)
THREADS_CONFIGURE_ENABLE=	tls

.include <bsd.port.pre.mk>


post-patch:
	cp ${FILESDIR}/*.h ${WRKSRC}/os/midnightbsd/
	# Don't make empty directories, which created by devel/pcc-libs port
	@${REINPLACE_CMD} -e '/mkdir -p.*PCC.*DIR/d' \
		${WRKSRC}/cc/cc/Makefile.in
	@${REINPLACE_CMD} -e '/targmach=amd64/s/x86_64/amd64/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's,\" MKS(TARGOSVER),${OSREL:R}\",' \
		${WRKSRC}/os/midnightbsd/ccconfig.h

.include <bsd.port.post.mk>

# $MidnightBSD$

PORTNAME=	smartmontools
PORTVERSION=	6.4
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.M.A.R.T. disk monitoring tools

LICENSE=	gpl2

CONFLICTS=	smartmontools-devel-[0-9]*

OPTIONS_DEFINE=	DOCS
DOCS_CONFIGURE_OFF=	--without-docdir --without-exampledir
DOCS_CONFIGURE_ON=	--with-docdir=${DOCSDIR}

USES=		alias gmake
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-drivedb --enable-sample \
		--with-initscriptdir=${PREFIX}/etc/rc.d

SUB_FILES=	pkg-message smart
USE_RC_SUBR=	smartd

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e 's| install-initdDATA| |' ${WRKSRC}/Makefile.in

post-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKDIR}/smart ${PREFIX}/etc/periodic/daily/smart

.include <bsd.port.mk>

# $MidnightBSD$

PORTNAME=	msghack
PORTVERSION=	0.2
CATEGORIES=	devel
MASTER_SITES=	CENKES
PKGNAMEPREFIX=	gettext-
# Bundled in fedora gettext srpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alter gettext po files in special ways

LICENSE=	gpl2

NO_BUILD=	yes
USES=		python tar:bzip2
PLIST_FILES=	bin/${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e '1s|/usr/bin/python|${PYTHON_CMD}|'\
		${WRKSRC}/${PORTNAME}.py

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME}.py ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>

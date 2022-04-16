PORTNAME=	phpmailer
PORTVERSION=	6.6.0
DISTVERSIONPREFIX=	v
CATEGORIES=	mail
PKGNAMESUFFIX=	6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full Featured Email Transfer Class for PHP

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe php

CONFLICTS_INSTALL=	phpmailer

PORTSCOUT=	limit:^6\.

CPE_VENDOR=	phpmailer_project

USE_GITHUB=	yes
GH_ACCOUNT=	PHPMailer
GH_PROJECT=	PHPMailer

NO_BUILD=	yes
NO_ARCH=	yes
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

do-install:
	@${MKDIR} ${DATADIR}
.for f in Exception.php PHPMailer.php POP3.php SMTP.php
	${INSTALL_DATA} ${WRKSRC}/src/$f ${DATADIR}
.endfor

post-install-NLS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR}/language
	${INSTALL_DATA} ${WRKSRC}/language/* ${FAKE_DESTDIR}${DATADIR}/language

.include <bsd.port.mk>

PORTNAME=	aws-ec2-imdsv2-get
DISTVERSION=	1.0.5
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reads data from EC2 IMDS with v2 protocol
WWW=		https://github.com/aws/aws-ec2-imdsv2-get

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cargo
USE_GITHUB=	yes
GH_ACCOUNT=	aws

PORTDOCS=	NOTICE README.md

OPTIONS_DEFINE=	DOCS

PLIST_FILES=	bin/aws-ec2-imdsv2-get

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>

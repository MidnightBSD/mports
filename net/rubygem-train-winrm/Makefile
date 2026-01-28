PORTNAME=	train-winrm
PORTVERSION=	0.4.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allow applictaions using Train to speak to Windows using Remote Management
WWW=		https://github.com/inspec/train-winrm

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-chef-winrm>=2.4.4<2.5:sysutils/rubygem-chef-winrm \
		rubygem-chef-winrm-elevated>=1.2.5<1.3:sysutils/rubygem-chef-winrm-elevated \
		rubygem-chef-winrm-fs>=1.4.1<1.5:filesystems/rubygem-chef-winrm-fs \
		rubygem-socksify>=1.8<2:www/rubygem-socksify

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>

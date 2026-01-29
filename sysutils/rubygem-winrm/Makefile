PORTNAME=	winrm
DISTVERSION=	2.3.9
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Windows Remote Management
WWW=		https://github.com/WinRb/WinRM

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-builder>=2.1.2:devel/rubygem-builder \
		rubygem-erubi>=1.8:www/rubygem-erubi \
		rubygem-gssapi>=1.2:security/rubygem-gssapi \
		rubygem-gyoku>=1.0:devel/rubygem-gyoku \
		rubygem-httpclient>=2.2.0.2:www/rubygem-httpclient \
		rubygem-logging>=1.6.1:devel/rubygem-logging \
		rubygem-nori>=2.0:devel/rubygem-nori \
		rubygem-rexml>=3.0:textproc/rubygem-rexml \
		rubygem-rubyntlm>=0.6.3:net/rubygem-rubyntlm

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/rwinrm

.include <bsd.port.mk>

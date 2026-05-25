PORTNAME=	octokit
PORTVERSION=	9.2.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple wrapper for the GitHub API
WWW=		https://octokit.github.io/octokit.rb/ \
		https://github.com/octokit/octokit.rb

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-faraday-gitlab>=1<3:www/rubygem-faraday-gitlab \
		rubygem-sawyer>=0.9<1:www/rubygem-sawyer

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>

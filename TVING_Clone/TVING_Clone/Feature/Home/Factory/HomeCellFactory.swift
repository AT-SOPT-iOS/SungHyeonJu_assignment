//
//  HomeCellFactory.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import UIKit

struct HomeCellFactory {
    static func makeCell(
        for model: HomeModel,
        at indexPath: IndexPath,
        in collectionView: UICollectionView
    ) -> UICollectionViewCell {
        switch model {
        case .mainPoster(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .mainPoster)
            return cell

        case .movie(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .movie)
            return cell

        case .recommand(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .recommand)
            return cell

        case .serviceLogos(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .serviceLogo)
            return cell

        case .baseballLogos(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            let bgColor = indexPath.item % 2 == 0 ? UIColor.white : UIColor.black
            cell.configure(image: items[indexPath.item].image, style: .baseball, backgroundColorOverride: bgColor)
            return cell

        case .todayTop20(let items):
            let model = items[indexPath.item]
            let cell = collectionView.dequeueReusableCell(type: TodayTop20Cell.self, forIndexPath: indexPath)
            cell.configure(image: model.image, ranking: model.ranking)
            return cell

        case .live(let items):
            let model = items[indexPath.item]
            let cell = collectionView.dequeueReusableCell(type: LiveChannelCell.self, forIndexPath: indexPath)
            cell.configure(
                image: model.image,
                ranking: model.ranking,
                channel: model.channel,
                title: model.title,
                percentage: model.percentage
            )
            return cell
        }
    }
}
